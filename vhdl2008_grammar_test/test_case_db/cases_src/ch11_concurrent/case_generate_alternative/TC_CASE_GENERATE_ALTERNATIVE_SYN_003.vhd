-- =============================================================
-- Case ID: TC_CASE_GENERATE_ALTERNATIVE_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_CASE_GENERATE_ALTERNATIVE
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: case_generate_alternative ::= when [ alternative_label : ] choices => generate_statement_body
-- Case Type: Positive
-- Test Focus: a when branch with alternative_label — `when alt_a : 0 =>` attaches a label to the branch, and the generate_statement_body contains a component instantiation, verifying the complete form of a labeled alternative in case generate
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cgen_alt_label_ent is
  port(a, b : in bit_vector(3 downto 0); y : out bit_vector(3 downto 0));
end entity cgen_alt_label_ent;

entity adder4 is
  port(x, y : in bit_vector(3 downto 0); s : out bit_vector(3 downto 0));
end entity adder4;
architecture dataflow of adder4 is
begin
  s <= x xor y;
end architecture dataflow;

architecture bh of cgen_alt_label_ent is
  subtype t_sel is integer range 0 to 1;
  constant sel : t_sel := 0;
begin
  gen_sel : case sel generate
    when alt_add : 0 =>
      add_inst : entity work.adder4 port map(x => a, y => b, s => y);
    when alt_pass : 1 =>
      y <= a;
  end generate gen_sel;
end architecture bh;
