-- =============================================================
-- Case ID: TC_LOGICAL_OPERATOR_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_LOGICAL_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: logical_operator ::= and | or | nand | nor | xor | xnor
-- Case Type: Positive
-- Test Focus: use of the nand and xnor operators in bit_vector bitwise operations — two 4-bit vectors nand-ed and xnor-ed bitwise, verifying the bitwise operation semantics of logical_operator on array types in VHDL 2008
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_nand_xnor_vec is
  port (
    a_i    : in  bit_vector(3 downto 0);
    b_i    : in  bit_vector(3 downto 0);
    n_o    : out bit_vector(3 downto 0);
    xn_o   : out bit_vector(3 downto 0)
  );
end entity ent_nand_xnor_vec;

architecture rtl of ent_nand_xnor_vec is
begin
  n_o  <= a_i nand b_i;
  xn_o <= a_i xnor b_i;
end architecture rtl;
