-- =============================================================
-- Case ID: TC_GENERATE_SPECIFICATION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_GENERATE_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: generate_specification ::= static_discrete_range | static_expression | alternative_label
-- Case Type: Positive
-- Test Focus: static_expression as a constant reference——the generate_specification uses the declared constant `C_FIRST_STAGE` as the index value, verifying that the expression can reference an enclosing constant
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gen_spec_const_ent is
  port(clk : in bit; din : in bit_vector(7 downto 0); dout : out bit_vector(7 downto 0));
end entity gen_spec_const_ent;
architecture bh of gen_spec_const_ent is
  constant C_FIRST_STAGE : integer := 0;
  constant C_LAST_STAGE  : integer := 3;
  type t_stage_arr is array(C_FIRST_STAGE to C_LAST_STAGE) of bit_vector(7 downto 0);
  signal s_pipe : t_stage_arr;
begin
  gen_shift : for i in C_FIRST_STAGE to C_LAST_STAGE-1 generate
  begin
    proc_reg : process(clk) is
    begin
      if clk'event and clk = '1' then
        s_pipe(i+1) <= s_pipe(i);
      end if;
    end process proc_reg;
  end generate gen_shift;
  s_pipe(C_FIRST_STAGE) <= din;
  dout <= s_pipe(C_LAST_STAGE);
end architecture bh;
