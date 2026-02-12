#!/usr/bin/env python3
"""Minimal phase DAG executor for DermalVision implementation planning.

This utility encodes phase tasks with dependency edges and outputs the
parallelizable waves in execution order, matching the PLAN -> IMPLEMENT ->
INTEGRATE -> VALIDATE -> DOCUMENT -> COMMIT model.
"""
from __future__ import annotations

from dataclasses import dataclass, field
from typing import Dict, List, Set


@dataclass(frozen=True)
class Task:
    id: str
    depends_on: Set[str] = field(default_factory=set)


def compute_waves(tasks: List[Task]) -> List[List[str]]:
    remaining: Dict[str, Set[str]] = {task.id: set(task.depends_on) for task in tasks}
    waves: List[List[str]] = []

    while remaining:
        ready = sorted(task_id for task_id, deps in remaining.items() if not deps)
        if not ready:
            cycle_nodes = ", ".join(sorted(remaining.keys()))
            raise ValueError(f"Dependency cycle detected across: {cycle_nodes}")

        waves.append(ready)
        done = set(ready)
        for task_id in ready:
            del remaining[task_id]
        for deps in remaining.values():
            deps.difference_update(done)

    return waves


def phase0_tasks() -> List[Task]:
    return [
        Task("project_structure"),
        Task("theme_system"),
        Task("typography_system"),
        Task("placeholder_routes"),
        Task("firebase_config"),
        Task("firebase_init", {"firebase_config"}),
        Task("auth_service", {"firebase_init"}),
        Task("auth_provider", {"auth_service"}),
        Task("router_config"),
        Task("base_providers"),
        Task("onboarding_flow", {"router_config"}),
        Task("wire_auth_router_home", {"auth_provider", "router_config", "placeholder_routes"}),
        Task("phase_quality_gates", {"wire_auth_router_home", "theme_system", "onboarding_flow"}),
    ]


if __name__ == "__main__":
    print("DermalVision Phase 0 execution waves")
    for index, wave in enumerate(compute_waves(phase0_tasks()), start=1):
        print(f"Wave {index}: {', '.join(wave)}")
