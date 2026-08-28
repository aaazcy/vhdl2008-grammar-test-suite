-- =============================================================
-- Case ID: TC_SIGNATURE_SYN_009
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGNATURE
-- Standard Reference: IEEE 1076-2008 Section 4.4
-- Production: signature ::= [ [ type_mark { , type_mark } ] [ return type_mark ] ]
-- Case Type: Positive
-- Test Focus: signature used in attribute name prefix: function_name [signature]'attribute - verification of signature in attribute_name context
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sig_attr_ent is port(r:out integer); end entity;
architecture bh of sig_attr_ent is
  function f_test return integer is begin return 42; end function;
  alias a_f is f_test [return integer];
begin
  r<=a_f;
end architecture bh;
