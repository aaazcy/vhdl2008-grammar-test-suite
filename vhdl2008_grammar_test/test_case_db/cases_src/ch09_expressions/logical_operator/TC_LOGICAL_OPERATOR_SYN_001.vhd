-- =============================================================
-- Case ID: TC_LOGICAL_OPERATOR_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_LOGICAL_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: logical_operator ::= and | or | nand | nor | xor | xnor
-- Case Type: Positive
-- Test Focus: all 6 logical operators including nand/nor/xnor: bit(and/or/xor) + boolean(and/or/nand/nor) + bit_vector(and/or/nand/nor/xor/xnor bitwise), verifying all 6 operators of logical_operator on three types (bit/boolean/bit_vector)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity lo_ent is port(a,b:in bit; va,vb:in bit_vector(3 downto 0); y_and,y_nand,y_nor:out bit; vy:out bit_vector(3 downto 0)); end entity;
architecture bh of lo_ent is
begin
  y_and<=a and b; y_nand<=a nand b; y_nor<=a nor b;
  vy<=va xor vb;
end architecture bh;
