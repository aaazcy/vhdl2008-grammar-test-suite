-- =============================================================
-- Case ID: TC_GENERATE_STATEMENT_BODY_SEM_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_GENERATE_STATEMENT_BODY
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: generate_statement_body ::= [ block_declarative_part begin ] { concurrent_statement } [ end [ alternative_label ] ; ]
-- Rule Description: Each generate body introduces a new declarative region — signals declared in one body instance are separate objects from signals declared in another body instance, even with the same identifier
-- Case Type: Positive
-- Test Focus: Local signals independent across different iterations of the same for generate——the s_local of each generate body instance is a separate object and iterations do not conflict, verifying that a generate body creates an independent declarative region for each generation
-- Expected Result: Compiles successfully; each generate iteration has its own s_local signal
-- Dependencies: None
-- =============================================================
entity gen_body_sem2_ent is
  port(clk : in bit; din : in bit; dout : out bit_vector(3 downto 0));
end entity gen_body_sem2_ent;
architecture bh of gen_body_sem2_ent is
  signal s_chain : bit_vector(0 to 4);
begin
  s_chain(0) <= din;
  gen_shift : for i in 0 to 3 generate
    signal s_local : bit;
  begin
    s_local <= s_chain(i);
    proc_ff : process(clk) is
    begin
      if clk'event and clk = '1' then
        s_chain(i+1) <= s_local;
      end if;
    end process proc_ff;
  end generate gen_shift;
  dout <= s_chain(1 to 4);
end architecture bh;
