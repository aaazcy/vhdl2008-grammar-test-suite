-- =============================================================
-- Case ID: TC_CASE_GENERATE_STATEMENT_SEM_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_CASE_GENERATE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: case_generate_statement ::= generate_label : case expression generate case_generate_alternative { case_generate_alternative } end generate [ generate_label ] ;
-- Rule Description: The case expression determines which hardware structure is instantiated; all concurrent statements in the selected alternative execute, while unselected alternatives behave as if they never existed
-- Case Type: Positive
-- Test Focus: generic selects different pipeline depths — OP_MODE=0 is pass-through, OP_MODE=1 is a single register stage, OP_MODE=2 is a two-stage pipeline, and each branch has a different number of processes, verifying that case generate implements a variable-depth pipeline
-- Expected Result: Compiles successfully; pipeline depth varies by generic selection
-- Dependencies: None
-- =============================================================
entity cgen_sem2_ent is
  generic(OP_MODE : integer := 0);
  port(clk : in bit; din : in bit_vector(7 downto 0); dout : out bit_vector(7 downto 0));
end entity cgen_sem2_ent;
architecture bh of cgen_sem2_ent is
begin
  gen_pipe : case OP_MODE generate
    when 0 =>
      dout <= din;
    when 1 =>
      signal s_reg : bit_vector(7 downto 0);
    begin
      proc_single : process(clk) is
      begin
        if clk'event and clk = '1' then
          s_reg <= din;
          dout  <= s_reg;
        end if;
      end process proc_single;
    end;
    when 2 =>
      signal s_s1, s_s2 : bit_vector(7 downto 0);
    begin
      proc_stage1 : process(clk) is
      begin
        if clk'event and clk = '1' then
          s_s1 <= din;
        end if;
      end process proc_stage1;
      proc_stage2 : process(clk) is
      begin
        if clk'event and clk = '1' then
          s_s2 <= s_s1;
          dout <= s_s2;
        end if;
      end process proc_stage2;
    end;
    when others =>
      dout <= not din;
  end generate gen_pipe;
end architecture bh;
