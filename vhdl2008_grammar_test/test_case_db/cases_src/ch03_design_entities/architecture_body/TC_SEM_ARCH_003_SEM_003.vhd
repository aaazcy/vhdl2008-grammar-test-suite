-- =============================================================
-- Case ID: TC_SEM_ARCH_003_SEM_003
-- Rule Type: Semantic
-- Related Rule ID: SEM_ARCH_003
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Rule Description: Identifiers declared in architecture_declarative_part must be visible in architecture_statement_part - normal use of declarative-part items in the statement part is legal semantic behavior
-- Case Type: Positive
-- Error Category: scope_visibility_error
-- Test Focus: Positive case: declarative part defines a custom physical type (t_freq with Hz/kHz/MHz units), a constant, and a signal, a process in the statement part uses a physical literal (100 MHz) via signal assignment, verifying types, constants, and signals defined in the declarative part all resolve and work in the statement part
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sem_arch_003_ent is
  port(trigger:in bit; status_out:out boolean);
end entity;
architecture visible of sem_arch_003_ent is
  type t_freq is range 0 to 1000000000 units
    Hz;   kHz=1000 Hz;   MHz=1000 kHz;
  end units;
  constant C_TARGET:t_freq:=100 MHz;
  signal s_freq:t_freq:=0 Hz;
  signal s_locked:boolean:=false;
begin
  process(trigger)
  begin
    if trigger'event and trigger='1' then
      s_freq<=C_TARGET;
      if s_freq>=C_TARGET then
        s_locked<=true;
      end if;
    end if;
  end process;
  status_out<=s_locked;
end architecture visible;
