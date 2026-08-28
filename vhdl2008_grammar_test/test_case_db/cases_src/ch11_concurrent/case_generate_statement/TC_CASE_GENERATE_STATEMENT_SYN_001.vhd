-- =============================================================
-- Case ID: TC_CASE_GENERATE_STATEMENT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CASE_GENERATE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: case_generate_statement ::= generate_label : case expression generate case_generate_alternative { case_generate_alternative } end generate [ generate_label ] ;
-- Case Type: Positive
-- Test Focus: Case generate with 4 branches + label: VHDL 2008 case generate uses G_MODE to select different combinations of concurrent statements (component inst/block/concurrent assign), and end generate closes with the label, verifying the complete syntax of case_generate_alternative
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cg_ent is
  generic(G_MODE:integer:=0);
  port(a,b:in bit; y:out bit);
end entity;
architecture bh of cg_ent is
  component and2 is port(x1,x2:in bit; z:out bit); end component;
begin
  gen_mode:case G_MODE generate
    when 0 => y<=a and b;
    when 1 => u_and:and2 port map(x1=>a,x2=>b,z=>y);
    when 2 => b_blk:block begin y<=a xor b; end block;
    when others => y<='0';
  end generate gen_mode;
end architecture bh;
