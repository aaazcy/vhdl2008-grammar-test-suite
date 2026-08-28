-- =============================================================
-- Case ID: TC_ELEMENT_SUBTYPE_DEFINITION_SMN_002
-- Rule Type: Static Model
-- Related Rule ID: BNF_ELEMENT_SUBTYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: element_subtype_definition ::= subtype_indication
-- Case Type: Negative
-- Test Focus: Static model negative — element subtype definition
--            references a non-existent type_mark. The
--            element_subtype_definition requires a valid subtype_indication
--            but the type_mark 'bad_type' has not been declared,
--            causing an undefined type error.
-- Expected Result: Triggers undefined type error
-- Dependencies: None
-- =============================================================
entity elem_subtype_undefined_type is
  port (
    dout : out integer
  );
end entity elem_subtype_undefined_type;

architecture rtl of elem_subtype_undefined_type is
  type t_bad_arr is array (0 to 7) of bad_type;  -- ERROR: 'bad_type' not declared
  signal s : t_bad_arr;
begin
  dout <= 0;
end architecture rtl;
