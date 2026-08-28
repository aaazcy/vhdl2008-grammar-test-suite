-- =============================================================
-- Case ID: TC_RANGE_CONSTRAINT_SMN_002
-- Related Rule ID: SMN_RANGE_CO_002
-- Rule Type: Static Model
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: range_constraint ::= range range
-- Case Type: Negative
-- Test Focus: Static model negative — the range constraint 'integer range 10 downto 0.0' uses a real right bound although the base type is integer, so the constraint cannot be matched against the base type
-- Expected Result: Triggers semantic error: can't match floating point literal with type integer
-- Dependencies: None
-- =============================================================
entity rc41_ent is
  port ( dout : out integer );
end entity rc41_ent;
architecture rtl of rc41_ent is
  subtype t_bad is integer range 10 downto 0.0;
begin
  dout <= 0;
end architecture rtl;
