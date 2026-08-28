-- =============================================================
-- Case ID: TC_GUARDED_SIGNAL_SPECIFICATION_SMN_001
-- Rule Type: Semantic (Negative)
-- Related Rule ID: BNF_GUARDED_SIGNAL_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.3
-- Production: guarded_signal_specification ::= guarded_signal_list : type_mark
-- Case Type: Negative (Semantic)
-- Test Focus: type_mark in guarded_signal_specification does not match the actual type of the guarded signal -- the signal "s_bus" is declared as bit bus but the disconnect specification uses type_mark "bit_vector", which is a type mismatch; the type_mark must match the signal's declared type
-- Expected Result: Triggers semantic error (type_mark mismatch with guarded signal type)
-- Dependencies: None
-- =============================================================
entity gss_smn_type_err is
  port(
    din  : in  bit;
    dout : out bit bus
  );
end entity;

architecture bh of gss_smn_type_err is
  signal s_bus : bit bus := '0';
  -- ERROR: type_mark "bit_vector" does not match signal type "bit"
  disconnect s_bus : bit_vector after 3 ns;
begin
  s_bus <= din;
  dout <= s_bus;
end architecture bh;
