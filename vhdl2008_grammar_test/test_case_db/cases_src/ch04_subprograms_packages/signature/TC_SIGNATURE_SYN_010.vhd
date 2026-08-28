-- =============================================================
-- Case ID: TC_SIGNATURE_SYN_010
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGNATURE
-- Standard Reference: IEEE 1076-2008 Section 4.4
-- Production: signature ::= [ [ type_mark { , type_mark } ] [ return type_mark ] ]
-- Case Type: Positive
-- Test Focus: signature with array type as type_mark: [bit_vector return integer], verification of composite type mark in signature
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sig_array_ent is port(v:in bit_vector(7 downto 0); r:out integer); end entity;
architecture bh of sig_array_ent is
  function f_len(bv:bit_vector) return integer is
  begin return bv'length; end function;
  alias a_len is f_len [bit_vector return integer];
begin
  r<=a_len(v);
end architecture bh;
