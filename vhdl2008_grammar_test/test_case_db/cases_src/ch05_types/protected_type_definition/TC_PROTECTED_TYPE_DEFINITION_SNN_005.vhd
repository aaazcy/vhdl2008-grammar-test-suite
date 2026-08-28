-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_DEFINITION_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROTECTED_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_definition ::= protected_type_declaration | protected_type_body
-- Case Type: Negative
-- Test Focus: Syntax error -- protected type definition with
--            malformed end label. The optional simple name after
--            end protected body contains an invalid character
--            making it an illegal identifier.
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity pt_def_snn_bad_end_label is
end entity pt_def_snn_bad_end_label;
architecture rtl of pt_def_snn_bad_end_label is
  type t_pt is protected
    procedure set(x : integer);
  end protected;
  type t_pt is protected body
    variable v : integer := 0;
    procedure set(x : integer) is begin v := x; end procedure;
  end protected body t_pt@bad;  -- ERROR: '@' not allowed in identifier
begin
end architecture rtl;
