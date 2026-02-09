# Kubectl Imperative Commands – Quick Reference

This document summarizes **imperative kubectl commands** that are useful for **one-off tasks**, **quick edits**, and **generating YAML templates** (especially helpful for exams).  
Primary workflow: **generate YAML with imperative commands → modify → apply declaratively**.

---

## Core Options (Very Important)

- `--dry-run=client`  
  Validates the command **without creating** the resource.

- `-o yaml`  
  Outputs the resource definition in **YAML format**.

✅ **Best practice:** Use both together to quickly generate editable YAML manifests.

---

## Pods

### Create an NGINX Pod
```bash
kubectl run nginx --image=nginx
```

### Generate Pod YAML (do not create)
```bash
kubectl run nginx --image=nginx --dry-run=client -o yaml
```

---

## Deployments

### Create a Deployment
```bash
kubectl create deployment nginx --image=nginx
```

### Generate Deployment YAML (do not create)
```bash
kubectl create deployment nginx --image=nginx --dry-run=client -o yaml
```

### Create Deployment with 4 Replicas
```bash
kubectl create deployment nginx --image=nginx --replicas=4
```

### Scale an Existing Deployment
```bash
kubectl scale deployment nginx --replicas=4
```

### Generate YAML and Save to File for Editing
```bash
kubectl create deployment nginx --image=nginx --dry-run=client -o yaml > nginx-deployment.yaml
```
Edit fields like `replicas`, `resources`, `labels`, etc., before applying.

---

## Services

### ClusterIP Service (Expose Pod `redis` on port 6379)

**Recommended (uses pod labels automatically):**
```bash
kubectl expose pod redis --port=6379 --name=redis-service --dry-run=client -o yaml
```

**Alternative (assumes selector `app=redis`):**
```bash
kubectl create service clusterip redis --tcp=6379:6379 --dry-run=client -o yaml
```
⚠️ Modify selectors manually if pod labels differ.

---

### NodePort Service (Expose Pod `nginx`)

**Using `expose` (no nodePort support directly):**
```bash
kubectl expose pod nginx --type=NodePort --port=80 --name=nginx-service --dry-run=client -o yaml
```
➡️ Edit YAML to manually add `nodePort`.

**Using `create service` (supports nodePort but not pod labels):**
```bash
kubectl create service nodeport nginx --tcp=80:80 --node-port=30080 --dry-run=client -o yaml
```
⚠️ Assumes selector `app=nginx`.

---

## Recommendation Summary

- Prefer **`kubectl expose`** for correct label selectors.
- If you need a **specific NodePort**, generate YAML and **edit manually**.
- Use imperative commands mainly to **bootstrap YAML**, not for long-term management.

---

## References

- kubectl Commands: https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands  
- kubectl Conventions: https://kubernetes.io/docs/reference/kubectl/conventions/
