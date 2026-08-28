-- =============================================================
-- Case ID: TC_SEM_DECL_003_SMN_006
-- Rule Type: Semantic
-- Related Rule ID: SEM_DECL_003
-- Standard Reference: IEEE 1076-2008 Section 6.5
-- Rule Description: The signal_kind 'register' is only permitted for signals declared in specific contexts; an architecture declarative part does not allow a register signal declaration
-- Case Type: Negative
-- Error Category: declaration_elaboration_error
-- Test Focus: Register-kind signal s_reg declared in the architecture declarative part, where the register keyword in the subtype indication position cannot be resolved
-- Expected Result: Triggers semantic error: type mark expected in a subtype indication
-- Dependencies: None
-- =============================================================
entity sd_ent is port(r:out integer); end entity;
architecture bh of sd_ent is
  signal s_reg : register bit := '0';
begin
  r <= 0;
end architecture bh;
