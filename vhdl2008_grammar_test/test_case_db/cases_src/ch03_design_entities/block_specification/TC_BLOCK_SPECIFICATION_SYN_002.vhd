-- =============================================================
-- Case ID: TC_BLOCK_SPECIFICATION_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 3.4.1
-- Production: block_specification ::= architecture_name | block_label | generate_label [ ( index ) ]
-- Case Type: Positive
-- Test Focus: Block specification three forms: architecture_name(work.ent(beh))/block_label(u_block)/generate_label(gen(0) with index), verifying all reference forms of block_specification in a configuration
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity dff is
  port (clk:in bit; d:in bit; q:out bit);
end entity dff;

architecture rtl of dff is
begin
end architecture rtl;

entity bs2_ent is port(clk,din:in bit; dout:out bit); end entity;
architecture rtl of bs2_ent is
  component dff is port(clk:in bit; d:in bit; q:out bit); end component;
  signal s_chain:bit_vector(0 to 3);
begin
  gen_ff:for i in 0 to 3 generate
    u_dff:dff port map(clk=>clk,d=>din,q=>s_chain(i));
  end generate;
  dout<=s_chain(3);
end architecture;
configuration bs2_cfg of bs2_ent is
  for rtl
    for gen_ff(0)
      for u_dff:dff use entity work.dff(rtl);
      end for;
    end for;
  end for;
end configuration bs2_cfg;
