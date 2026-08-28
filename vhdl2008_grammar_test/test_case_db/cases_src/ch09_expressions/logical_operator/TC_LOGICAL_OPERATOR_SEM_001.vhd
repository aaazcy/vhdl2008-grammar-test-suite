-- =============================================================
-- Case ID: TC_LOGICAL_OPERATOR_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_LOGICAL_OPERATOR_TYPES
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: logical_operator ::= and | or | nand | nor | xor | xnor
-- Case Type: Positive
-- Rule Description: Logical operators (and, or, nand, nor, xor, xnor) are predefined for types BIT and BOOLEAN, and for one-dimensional arrays of BIT and BOOLEAN. The operands must be of the same type.
-- Test Focus: semantic correctness of logical_operator on the four logic types bit, boolean, bit_vector, boolean_vector — each type uses its corresponding logical operation, verifying the VHDL predefined logical operator type rules
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_sem_logic_types is
  port (
    ba_i, bb_i : in  bit;
    boola_i, boolb_i : in  boolean;
    bva_i, bvb_i : in  bit_vector(3 downto 0);
    boova_i, boovb_i : in  boolean_vector(0 to 2);
    bo  : out bit;
    boolo : out boolean;
    bvo  : out bit_vector(3 downto 0);
    boovo : out boolean_vector(0 to 2)
  );
end entity ent_sem_logic_types;

architecture rtl of ent_sem_logic_types is
begin
  bo    <= ba_i and bb_i;
  boolo <= boola_i or boolb_i;
  bvo   <= bva_i xor bvb_i;
  boovo <= boova_i nand boovb_i;
end architecture rtl;
