import axios from 'axios';
import cds from '@sap/cds';

export default cds.service.impl(async function () {

    this.on('submitForApproval', async (req) => {

        const { ID } = req.data;

        console.log(`Workflow requested for Travel ID ${ID}`);

        return {
            status: 'SUCCESS',
            message: `Workflow triggered for Travel ${ID}`
        };
    });

    this.after('SAVE', 'Travel', async (data, req) => {

        const travel = req.data;

        if (!travel?.ID || !travel?.travel_id) {
            console.log('Workflow not started because Travel keys are missing');
            return;
        }

        const workflowPayload = {
            definitionId:
                'us10.e66895ddtrial.rap110travelworkflow.travelApprovalProcessing',
            context: {
                travelContext: {
                    TravelUUID: travel.ID,
                    TravelID: travel.travel_id,
                    IsActiveEntity: true,
                    agency_id: travel.agency_id,
                    customer_id: travel.customer_id,
                    begin_date: travel.begin_date,
                    end_date: travel.end_date,
                    booking_fee: Number(travel.booking_fee),
                    total_price: Number(travel.total_price),
                    currency_code: travel.currency_code,
                    description: travel.description,
                    overall_status: travel.overall_status
                }
            }
        };

        try {
            const tokenResponse = await axios.post(
                process.env.BPA_TOKEN_URL,
                new URLSearchParams({
                    grant_type: 'client_credentials'
                }).toString(),
                {
                    headers: {
                        'Content-Type':
                            'application/x-www-form-urlencoded'
                    },
                    auth: {
                        username: process.env.BPA_CLIENT_ID,
                        password: process.env.BPA_CLIENT_SECRET
                    }
                }
            );

            const accessToken = tokenResponse.data.access_token;

            const workflowResponse = await axios.post(
                process.env.BPA_WORKFLOW_URL,
                workflowPayload,
                {
                    headers: {
                        Authorization: `Bearer ${accessToken}`,
                        'api-key': process.env.BPA_API_KEY,
                        'Content-Type': 'application/json'
                    }
                }
            );

            console.log(
                `BPA workflow started for Travel ${travel.travel_id}`
            );

            console.log(
                `Workflow instance ID: ${workflowResponse.data.id}`
            );

        } catch (error) {
            console.error(
                `BPA workflow start failed for Travel ${travel.travel_id}`
            );

            console.error(
                `HTTP status: ${error.response?.status ?? 'No response'}`
            );

            console.error(
                JSON.stringify(
                    error.response?.data ?? { message: error.message },
                    null,
                    2
                )
            );
        }
        console.log(process.env.BPA_CLIENT_ID);
        console.log(process.env.BPA_TOKEN_URL);
    });
});