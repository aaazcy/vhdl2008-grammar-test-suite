-- =============================================================
-- Case ID: TC_IF_GENERATE_STATEMENT_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_IF_GENERATE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: if_generate_statement ::= generate_label : if [ alternative_label : ] condition generate generate_statement_body { elsif [ alternative_label : ] condition generate generate_statement_body } [ else [ alternative_label : ] generate generate_statement_body ] end generate [ generate_label ] ;
-- Case Type: Positive
-- Test Focus: elsif and else branches with alternative_labels——`elsif alt_bypass :` and `else alt_default :` attach labels to each branch, and each body contains a different component instantiation, verifying that labeled branches can identify different hardware instances
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ifgen_labeled_ent is
  generic(HAS_MULTIPLIER : boolean := true; HAS_DIVIDER : boolean := false);
  port(a, b : in bit_vector(7 downto 0); y : out bit_vector(7 downto 0));
end entity ifgen_labeled_ent;

entity mul8 is
  port(x, y : in bit_vector(7 downto 0); p : out bit_vector(7 downto 0));
end entity mul8;
architecture dataflow of mul8 is
begin
  p <= x xor y;
end architecture dataflow;

architecture bh of ifgen_labeled_ent is
begin
  gen_alu : if HAS_MULTIPLIER generate
    mul_inst : entity work.mul8 port map(x => a, y => b, p => y);
  elsif alt_div : HAS_DIVIDER generate
    y <= a and b;
  else alt_default : generate
    y <= a xor b;
  end generate gen_alu;
end architecture bh;
