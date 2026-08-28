-- =============================================================
-- Case ID: TC_LOGICAL_OPERATOR_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_LOGICAL_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: logical_operator ::= and | or | nand | nor | xor | xnor
-- Case Type: Positive
-- Test Focus: simple logical AND of the and operator on bit signals — two bit input ports are ANDed to obtain an enable signal, verifying the minimal syntax form of and as a logical_operator
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_and_bit is
  port (
    en_i  : in  bit;
    req_i : in  bit;
    gnt_o : out bit
  );
end entity ent_and_bit;

architecture rtl of ent_and_bit is
begin
  gnt_o <= en_i and req_i;
end architecture rtl;
