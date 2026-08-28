-- =============================================================
-- Case ID: TC_ACTUAL_DESIGNATOR_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ACTUAL_DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: actual_designator ::= [ inertial ] expression | signal_name
--              | variable_name | file_name | subtype_indication
--              | subprogram_name | instantiated_package_name | open
-- Case Type: Positive (Production-Specific)
-- Test Focus: actual_designator — exercises the expression and
--             signal_name alternatives within component instantiation.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity actual_designator_syn3 is
  port (
    clk      : in  bit;
    data_in  : in  integer range 0 to 255;
    data_out : out integer range 0 to 255
  );
end entity actual_designator_syn3;

architecture arch of actual_designator_syn3 is

  component pipeline_reg is
    generic (
      width : integer := 8
    );
    port (
      clk    : in  bit;
      d      : in  integer;
      q      : out integer
    );
  end component;

  subtype byte_val is integer range 0 to 255;

  signal s_stage_a : integer range 0 to 255 := 0;
  signal s_stage_b : integer range 0 to 255 := 0;

begin

  -- Process that exercises variable_name as actual_designator
  -- (through the pipeline_reg instantiation using a variable's value)
  process(clk)
    variable v_offset : integer range 0 to 255 := 10;
  begin
    if clk'event and clk = '1' then
      v_offset := data_in mod 16;
      s_stage_a <= data_in + v_offset;
    end if;
  end process;

  -- actual_designator = expression (s_stage_a + 1)
  -- actual_designator = signal_name (clk, s_stage_b)
  u_stage1 : component pipeline_reg
    generic map (
      width => 8
    )
    port map (
      clk => clk,
      d   => s_stage_a + 1,
      q   => s_stage_b
    );

  data_out <= s_stage_b;

end architecture arch;
