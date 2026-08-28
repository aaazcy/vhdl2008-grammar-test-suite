-- =============================================================
-- Case ID: TC_CONSTANT_DECLARATION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONSTANT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.4
-- Production: constant_declaration ::= constant identifier { , identifier } : subtype_indication [ := expression ] ;
-- Case Type: Positive
-- Test Focus: Constant multi-type+multi-identifier+deferred constant: integer/time/string/boolean/aggregate/bit_vector/physical literal default values, with double identifiers(C_X,C_Y), verifying constant supports various subtype_indications and default expressions
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity const_ent is port(y:out integer); end entity;
architecture bh of const_ent is
  constant C_W:integer:=8;
  constant C_D:time:=10 ns;
  constant C_X,C_Y:integer:=0;
  constant C_BITS:bit_vector(3 downto 0):="1010";
  constant C_PI:real:=3.14159;
  signal s:integer:=C_X+C_Y;
begin y<=s+C_W; end architecture bh;
