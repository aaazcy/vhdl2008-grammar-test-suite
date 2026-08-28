-- =============================================================
-- Case ID: TC_ELEMENT_SUBTYPE_DEFINITION_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_SUBTYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: element_subtype_definition ::= subtype_indication
-- Case Type: Negative
-- Test Focus: Syntax error -- element subtype definition with
--            typographical error in the type_mark. The identifier
--            'integre' is misspelled (should be 'integer'), causing
--            an undefined type reference.
-- Expected Result: Triggers undefined type error
-- Dependencies: None
-- =============================================================
entity elem_sub_def_snn_typo is
end entity elem_sub_def_snn_typo;
architecture rtl of elem_sub_def_snn_typo is
  type t_bad is array (0 to 7) of integre;  -- ERROR: 'integre' not defined (typo for integer)
  signal s : t_bad;
begin
end architecture rtl;
