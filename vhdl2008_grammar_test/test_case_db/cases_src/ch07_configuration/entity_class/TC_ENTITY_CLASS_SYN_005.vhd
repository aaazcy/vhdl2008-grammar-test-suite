-- =============================================================
-- Case ID: TC_ENTITY_CLASS_SYN_005
-- Rule Type: Syntax
-- BNF Production: ENTITY_CLASS
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_class ::= entity | architecture | configuration | procedure | function | package | type | subtype | constant | signal | variable | component | label | literal | units | group | file | property | sequence
-- Case Type: Positive
-- Test Focus: use of entity class "subtype" and "package" in attribute specifications — attributes applied respectively to a subtype declaration and an external package reference, verifies these two entity_class keywords are legal
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ec_subtype_pkg is
  port(a : in bit; y : out bit);
end entity;

architecture rtl of ec_subtype_pkg is
  subtype t_nibble is bit_vector(3 downto 0);
  constant C_NIB : t_nibble := "1010";
  attribute note : string;
  attribute note of t_nibble : subtype is "4-bit slice";
  signal s_val : t_nibble := C_NIB;
begin
  y <= a;
end architecture rtl;
