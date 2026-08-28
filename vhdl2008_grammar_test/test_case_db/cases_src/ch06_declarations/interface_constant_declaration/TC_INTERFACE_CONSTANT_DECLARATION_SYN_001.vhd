-- =============================================================
-- Case ID: TC_INTERFACE_CONSTANT_DECLARATION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_CONSTANT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_constant_declaration ::=
--   [ constant ] identifier_list : [ in ] subtype_indication [ := static_expression ]
-- Case Type: Positive
-- Test Focus: Constant generics with ALL optional tokens present:
--   "constant" keyword, "in" mode, ":=" default, multi-identifier list.
--   Exercises the maximal syntactic form.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity const_gen_full_form is
  generic (
    constant DATA_W, ADDR_W : in integer := 8;
    constant PIPELINE_DEPTH  : in natural := 3;
    constant CLK_PERIOD      : in time    := 10 ns
  );
  port (
    clk    : in  bit;
    addr   : in  bit_vector(ADDR_W - 1 downto 0);
    din    : in  bit_vector(DATA_W - 1 downto 0);
    dout   : out bit_vector(DATA_W - 1 downto 0)
  );
end entity const_gen_full_form;

architecture rtl of const_gen_full_form is
  type t_pipe_stage is array(0 to PIPELINE_DEPTH - 1) of bit_vector(DATA_W - 1 downto 0);
  signal pipeline : t_pipe_stage := (others => (others => '0'));
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      pipeline(0) <= din;
      for i in 1 to PIPELINE_DEPTH - 1 loop
        pipeline(i) <= pipeline(i - 1);
      end loop;
      dout <= pipeline(PIPELINE_DEPTH - 1);
    end if;
  end process;
end architecture rtl;
