# Kubernetes troubleshooting 

:comet: Troubleshoot Application Failures with #Kubernetes! :bangbang:
:warning: Troubleshooting #Kubernetes requires a systematic approach to identify and resolve issues. By leveraging Kubernetes’ built-in tools and commands, you can diagnose most common problems. Remember to start with simple checks and progressively move to more detailed investigations to efficiently troubleshoot application failures in Kubernetes.
1. Check Pod Status: To assess the health and status of your pods within a specific namespace, use the kubectl get pods command.
  -> kubectl get pods -n <namespace>
2. Review Pod Logs: To review the logs of a specific pod, which can be invaluable for troubleshooting, use the kubectl logs command.
 -> kubectl logs <pod-name> -n <namespace>
3. Use kubectl describe: For a comprehensive overview of a pod’s configuration and events, kubectl describe is invaluable.
 -> kubectl describe pod <pod-name> -n <namespace>
4. Check for Resource Constraints: Resource constraints can cause pods to fail to start or run properly. Use kubectl describe nodes to identify resource allocation and availability.
 -> kubectl describe nodes
5. Examine Liveness and Readiness Probes: Liveness and readiness probes determine the health of a pod. Misconfigurations can cause pods to be killed or not receive traffic. Define probes in your pod or deployment YAML.
6. Debugging with kubectl exec: kubectl exec lets you execute commands inside a container, which can be useful for debugging.
 -> kubectl exec -it <pod-name> -- /bin/sh
7. Inspect Kubernetes Events: Kubernetes events provide insight into what’s happening in the cluster. Use kubectl get events to retrieve events.
 -> kubectl get events --sort-by='.metadata.creationTimestamp' -n <namespace>
8. Verify Service and Ingress Configurations: Services and Ingresses are key to exposing Kubernetes applications. Misconfigurations can lead to inaccessible services. Use kubectl get to inspect these resources.
 -> kubectl get svc,ingress -n <namespace>
9. Analyze Network Policies: Network Policies define how pods communicate with each other and the outside world. Use kubectl get to list active network policies.
 -> kubectl get networkpolicy -n <namespace>
10. Check for ImagePullBackOff Errors: ImagePullBackOff indicates Kubernetes is unable to pull a container image. Inspect the pod or describe it to see the error details.
 -> kubectl describe pod <pod-name> -n <namespace>
11. Utilize Kubernetes Dashboard: The Kubernetes Dashboard provides a web-based UI for managing cluster resources. Install or access it to visually inspect resources, view logs, and manage workloads.
:sunglasses: 𝗙𝗼𝗹𝗹𝗼𝘄 @prodevopsguy 𝗳𝗼𝗿 𝗺𝗼𝗿𝗲 𝘀𝘂𝗰𝗵 𝗰𝗼𝗻𝘁𝗲𝗻𝘁 𝗮𝗿𝗼𝘂𝗻𝗱 𝗰𝗹𝗼𝘂𝗱 & 𝗗𝗲𝘃𝗢𝗽𝘀!!! // Join for DevOps DOCs: @devopsdocs on telegram