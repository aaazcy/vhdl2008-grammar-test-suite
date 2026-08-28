-- =============================================================
-- Case ID: TC_ELEMENT_CONSTRAINT_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: element_constraint ::= (empty)
-- Case Type: Negative
-- Test Focus: Syntax error -- element constraint used where the
--            grammar expects a specific constraint but receives
--            a malformed range expression instead of the expected
--            empty/inherited element constraint.
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity elem_con_snn_bad_range is
end entity elem_con_snn_bad_range;
architecture rtl of elem_con_snn_bad_range is
  type t_rec is record
    val : integer;
  end record;
  subtype t_bad is t_rec(val range 0 to 7);  -- ERROR: malformed element constraint syntax
  signal s : t_bad;
begin
end architecture rtl;
