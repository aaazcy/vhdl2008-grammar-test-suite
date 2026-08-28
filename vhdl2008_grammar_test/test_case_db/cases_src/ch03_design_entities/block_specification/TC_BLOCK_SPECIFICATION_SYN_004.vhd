-- =============================================================
-- Case ID: TC_BLOCK_SPECIFICATION_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 3.4.2
-- Production: block_specification ::= architecture_name block_statement_label | generate_statement_label [ ( generate_specification ) ]
-- Case Type: Positive
-- Test Focus: block_specification using the generate_statement_label form with index: for gen_label(0) in the configuration specifies the concrete 0th instance of the generate block and nests a component_configuration, verifying the generate_specification syntax with index
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity dff is
  port (clk, d : in bit; q : out bit);
end entity dff;

architecture rtl of dff is
begin
end architecture rtl;

entity bspec_gen_idx_ent is
  port(clk, din : in bit; dout : out bit);
end entity;
architecture rtl of bspec_gen_idx_ent is
  component dff is port(clk, d : in bit; q : out bit); end component;
  signal s_chain : bit_vector(0 to 1);
begin
  gen_chain : for i in 0 to 1 generate
    u_ff : dff port map(clk => clk, d => din, q => s_chain(i));
  end generate;
  dout <= s_chain(1);
end architecture;
configuration bspec_gen_idx_cfg of bspec_gen_idx_ent is
  for rtl
    for gen_chain(0)
      for u_ff : dff use entity work.dff(rtl);
      end for;
    end for;
  end for;
end configuration bspec_gen_idx_cfg;
