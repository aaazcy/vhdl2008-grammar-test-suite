-- =============================================================
-- Case ID: TC_RECORD_ELEMENT_CONSTRAINT_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_RECORD_ELEMENT_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: record_element_constraint ::= record_element_simple_name element_constraint
-- Case Type: Negative
-- Test Focus: Syntax error -- record element constraint with missing
--            element_constraint. The field name is specified but the
--            actual constraint is empty or malformed.
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity rec_elem_con_snn_empty is
end entity rec_elem_con_snn_empty;
architecture rtl of rec_elem_con_snn_empty is
  type t_rec is record
    val : integer range 0 to 255;
  end record;
  subtype t_bad is t_rec(val);  -- ERROR: field name without constraint value
  signal s : t_bad;
begin
end architecture rtl;
