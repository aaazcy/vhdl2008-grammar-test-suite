-- =============================================================
-- Case ID: TC_SHIFT_OPERATOR_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SHIFT_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: shift_operator ::= sll | srl | sla | sra | rol | ror
-- Case Type: Positive
-- Test Focus: All 6 shift operators: sll(logical left)/srl(logical right)/sla(arithmetic left)/sra(arithmetic right)/rol(rotate left)/ror(rotate right), used in bit_vector expressions
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity so_ent is port(v:in bit_vector(7 downto 0); y:out bit_vector(7 downto 0)); end entity;
architecture bh of so_ent is
begin
  y<=v sll 1 or v srl 2 or v rol 3 or v ror 4;
end architecture bh;
