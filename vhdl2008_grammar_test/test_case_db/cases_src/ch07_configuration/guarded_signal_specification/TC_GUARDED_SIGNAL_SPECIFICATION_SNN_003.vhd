-- =============================================================
-- Case ID: TC_GUARDED_SIGNAL_SPECIFICATION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_GUARDED_SIGNAL_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.3
-- Production: guarded_signal_specification ::= guarded_signal_list : type_mark
-- Case Type: Negative
-- Test Focus: Non-guarded signal in disconnect specification — disconnect specification can only reference guarded signals (declared with 'bus' or 'register'); using a non-guarded signal violates semantic rules of guarded_signal_specification
-- Expected Result: Triggers semantic error
-- Dependencies: None
-- =============================================================
entity gss_snn3_ent is port(r:out bit); end entity;
architecture bh of gss_snn3_ent is
  signal s : bit := '0';  -- not a guarded signal (no 'bus' keyword)
  -- ERROR: disconnect only applies to guarded signals
  disconnect s : bit after 1 ns;
begin
  s <= '1'; r <= s;
end architecture bh;
