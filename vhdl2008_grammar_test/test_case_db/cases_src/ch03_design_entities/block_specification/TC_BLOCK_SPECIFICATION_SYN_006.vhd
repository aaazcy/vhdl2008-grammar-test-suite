-- =============================================================
-- Case ID: TC_BLOCK_SPECIFICATION_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 3.4.2
-- Production: block_specification ::= architecture_name block_statement_label | generate_statement_label [ ( generate_specification ) ]
-- Case Type: Positive
-- Test Focus: block_specification mixing two syntaxes: in the same configuration the outer level uses architecture_name(for rtl), the middle uses generate_label(for gen_stage) with a complete generate range, and the inner uses a concrete instance index (gen_stage(1)) embedding a component_configuration
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity dff_r is
  port (clk, rst, d : in bit; q : out bit);
end entity dff_r;

architecture rtl of dff_r is
begin
end architecture rtl;

entity bspec_mixed_ent is
  port(clk, rst, d : in bit; q : out bit_vector(1 downto 0));
end entity;
architecture rtl of bspec_mixed_ent is
  component dff_r is port(clk, rst, d : in bit; q : out bit); end component;
begin
  gen_stage : for i in 0 to 1 generate
    u_ff : dff_r port map(clk => clk, rst => rst, d => d, q => q(i));
  end generate;
end architecture;
configuration bspec_mixed_cfg of bspec_mixed_ent is
  for rtl
    for gen_stage
      for u_ff : dff_r use entity work.dff_r(rtl);
      end for;
    end for;
  end for;
end configuration bspec_mixed_cfg;
