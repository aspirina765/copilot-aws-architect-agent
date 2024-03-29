#!/usr/bin/env bash 

cd app ; 
pipenv install ; 
pip install -r requirements.txt ; 
# Learn how to get your own free key here https://huggingface.co/docs/hub/security-tokens
export HUGGING_FACE_KEY=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
streamlit run agent_aws_st.py ; 
# View at localhost:8501


docker login -u tiops -p ''

## ngok http 8501 --domain=tiops.ngrok.dev

cd app ; 
docker build -t streamlit . ; 
docker run -p 8501:8501 streamlit ; 

docker tag  streamlit:latest tiops/copilot-aws-architect-streamlit:latest ;
docker push  tiops/copilot-aws-architect-streamlit:latest ;
###

docker login -u tiops -p 'Admin@!2023$'