from tools.bootstrap.phase_executor import Task, compute_waves, phase0_tasks


def test_phase0_contains_wave_for_wiring_after_auth_and_router():
    waves = compute_waves(phase0_tasks())
    wave_index = next(i for i, wave in enumerate(waves) if "wire_auth_router_home" in wave)

    prereqs = {"auth_provider", "router_config", "placeholder_routes"}
    completed_before = set().union(*waves[:wave_index]) if wave_index > 0 else set()
    assert prereqs.issubset(completed_before)


def test_compute_waves_raises_on_cycle():
    cyclic = [
        Task("a", {"b"}),
        Task("b", {"a"}),
    ]

    try:
        compute_waves(cyclic)
    except ValueError as exc:
        assert "Dependency cycle detected" in str(exc)
    else:
        raise AssertionError("Expected ValueError for cycle")
