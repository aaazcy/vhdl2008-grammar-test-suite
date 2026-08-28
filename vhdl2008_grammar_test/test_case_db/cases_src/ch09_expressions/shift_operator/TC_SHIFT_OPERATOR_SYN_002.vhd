-- =============================================================
-- Case ID: TC_SHIFT_OPERATOR_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SHIFT_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: shift_operator ::= sll | srl | sla | sra | rol | ror
-- Case Type: Positive
-- Test Focus: sll logical left shift — 8-bit bit_vector shifted left by 2 with zero fill in the low bit, verifying the basic syntax of sll (shift left logical) in a concurrent signal assignment
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_sll_8bit is
  port (
    din  : in  bit_vector(7 downto 0);
    sh   : in  integer range 0 to 7;
    dout : out bit_vector(7 downto 0)
  );
end entity ent_sll_8bit;

architecture rtl of ent_sll_8bit is
begin
  dout <= din sll sh;
end architecture rtl;
