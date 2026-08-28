-- =============================================================
-- Case ID: TC_DISCRETE_RANGE_SMN_001
-- Rule Type: Static Model
-- Related Rule ID: BNF_DISCRETE_RANGE
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: discrete_range ::= discrete_subtype_indication | range
-- Case Type: Negative
-- Test Focus: static model negative — the discrete_range '0 to 7.5' uses a real right bound although the index subtype is integer, so the range cannot be resolved against the index type
-- Expected Result: Triggers semantic error: can't match floating point literal with type integer
-- Dependencies: None
-- =============================================================
entity dr13_ent is end entity;
architecture rtl of dr13_ent is
  type t_bad is array(integer range 0 to 7.5) of integer;
begin
end architecture;
