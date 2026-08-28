-- =============================================================
-- Case ID: TC_DISCRETE_RANGE_SMN_002
-- Rule Type: Static Model
-- Related Rule ID: BNF_DISCRETE_RANGE
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: discrete_range ::= discrete_subtype_indication | range
-- Case Type: Negative
-- Test Focus: static model negative — the discrete_range 'no_such_t range 0 to 7' uses the discrete_subtype_indication form whose type mark no_such_t has never been declared, so the range cannot be resolved
-- Expected Result: Triggers semantic error: no declaration for "no_such_t"
-- Dependencies: None
-- =============================================================
entity dr14b_ent is end entity;
architecture rtl of dr14b_ent is
  type t_bad is array(no_such_t range 0 to 7) of integer;
begin
end architecture;
