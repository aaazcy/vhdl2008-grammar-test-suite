-- =============================================================
-- Case ID: TC_IF_GENERATE_STATEMENT_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_IF_GENERATE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: if_generate_statement ::= generate_label : if [ alternative_label : ] condition generate generate_statement_body { elsif [ alternative_label : ] condition generate generate_statement_body } [ else [ alternative_label : ] generate generate_statement_body ] end generate [ generate_label ] ;
-- Rule Description: The if generate condition must be locally static; only the first branch whose condition evaluates to true is elaborated; if no condition is true and no else branch exists, no body is elaborated
-- Case Type: Positive
-- Test Focus: Only the first true branch is elaborated——with two generic conditions, the elsif branch takes effect only when PIPELINE=true, verifying the short-circuit semantics of if generate: the first true condition branch is selected and the later branches are ignored
-- Expected Result: Compiles successfully; only the first matching branch is elaborated
-- Dependencies: None
-- =============================================================
entity ifgen_sem1_ent is
  generic(HAS_BYPASS : boolean := true; HAS_PIPELINE : boolean := false);
  port(clk : in bit; din : in bit_vector(7 downto 0); dout : out bit_vector(7 downto 0));
end entity ifgen_sem1_ent;
architecture bh of ifgen_sem1_ent is
begin
  gen_sel : if HAS_BYPASS generate
    dout <= din;
  elsif HAS_PIPELINE generate
    signal s_reg : bit_vector(7 downto 0);
  begin
    proc_ff : process(clk) is
    begin
      if clk'event and clk = '1' then
        s_reg <= din;
        dout  <= s_reg;
      end if;
    end process proc_ff;
  end;
  else generate
    dout <= not din;
  end generate gen_sel;
end architecture bh;
