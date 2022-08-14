# kubernetes commands
## delete evicted pods
    kubectl get pods --field-selector=status.phase=Failed
    kubectl delete pods --field-selector=status.phase=Failed
