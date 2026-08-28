-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_BODY_DECLARATIVE_PART_SNN_005
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_body_declarative_part ::= { protected_type_body_declarative_item }
-- Case Type: Negative
-- Test Focus: Syntax error in protected body declarative item —
--            constant declaration without initialization expression.
--            A constant in the protected body must have a value.
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity pt_body_dp_snn_const_no_init is
end entity pt_body_dp_snn_const_no_init;
architecture rtl of pt_body_dp_snn_const_no_init is
  type t_pt is protected
    impure function get return integer;
  end protected;
  type t_pt is protected body
    constant C_BAD : integer;        -- ERROR: constant requires initialization
    impure function get return integer is begin return 0; end function;
  end protected body;
begin
end architecture rtl;
