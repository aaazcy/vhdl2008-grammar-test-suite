-- =============================================================
-- Case ID: TC_ARCHITECTURE_STATEMENT_PART_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARCHITECTURE_STATEMENT_PART
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Production: architecture_statement_part ::= { concurrent_statement }
-- Case Type: Positive
-- Test Focus: VHDL 2008 case generate + process(all): statement part contains VHDL 2008 case_generate (G_MODE selected implementation) + process(all) implicit sensitivity, verifying the VHDL 2008 new concurrent statement forms in the statement part
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity asp_2008_ent is
  generic(G_MODE:integer:=0);
  port(a,b:in bit; y:out bit);
end entity;
architecture bh of asp_2008_ent is
  component and2 is port(x1,x2:in bit; z:out bit); end component;
  signal s_a,s_b:bit;
begin
  s_a<=a; s_b<=b;
  gen_mode:case G_MODE generate
    when 0 => y<=s_a and s_b;
    when 1 => u_and:and2 port map(x1=>s_a,x2=>s_b,z=>y);
    when others => y<='0';
  end generate;
  p_mon:process(all) begin
    assert not(s_a='1' and s_b='1') report "both high" severity note;
  end process;
end architecture bh;
