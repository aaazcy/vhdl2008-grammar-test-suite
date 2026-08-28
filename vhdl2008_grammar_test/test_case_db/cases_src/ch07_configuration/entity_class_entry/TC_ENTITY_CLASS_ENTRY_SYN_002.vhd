-- =============================================================
-- Case ID: TC_ENTITY_CLASS_ENTRY_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_CLASS_ENTRY
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_class_entry ::= entity_class [ <> ]
-- Case Type: Positive
-- Test Focus: Entity class entry without box in group template declarations — exercises entity_class_entry used in a realistic design with multiple group templates where entity_class appears without '<>' box, covering signal, variable, label, and component classes in a pipelined adder context
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity full_adder_8bit is
  port(
      a_in  : in  bit_vector(7 downto 0);
      b_in  : in  bit_vector(7 downto 0);
      c_out : out bit_vector(8 downto 0)
    );
end entity full_adder_8bit;

architecture rtl of full_adder_8bit is
begin
end architecture rtl;


library ieee;
use ieee.numeric_bit.all;

entity ece_pipe_adder is
  port(
    clk    : in  bit;
    a      : in  bit_vector(7 downto 0);
    b      : in  bit_vector(7 downto 0);
    sum    : out bit_vector(8 downto 0)
  );
end entity;

architecture rtl of ece_pipe_adder is
  -- Group template using entity_class_entry without box for structural classes
  group pipe_stage is (signal, signal, label);
  -- Group template for verification grouping
  group verify_group is (signal, variable, component);

  signal a_r    : bit_vector(7 downto 0) := (others => '0');
  signal b_r    : bit_vector(7 downto 0) := (others => '0');
  signal sum_i  : bit_vector(8 downto 0) := (others => '0');

  component full_adder_8bit is
    port(
      a_in  : in  bit_vector(7 downto 0);
      b_in  : in  bit_vector(7 downto 0);
      c_out : out bit_vector(8 downto 0)
    );
  end component;

  for adder_inst : full_adder_8bit
    use entity work.full_adder_8bit(rtl);

  -- Apply group template to actual design objects
  group stage1 : pipe_stage (a_r, b_r, adder_inst);
begin
  process(clk)
    variable v_sum : bit_vector(8 downto 0);
    group vfy : verify_group (sum_i, v_sum, full_adder_8bit);
  begin
    if clk'event and clk = '1' then
      a_r <= a;
      b_r <= b;
      v_sum := bit_vector(('0' & unsigned(a_r)) + ('0' & unsigned(b_r)));
      sum_i <= v_sum;
    end if;
  end process;

  adder_inst : full_adder_8bit
    port map(a_in => a_r, b_in => b_r, c_out => sum_i);
  sum <= sum_i;
end architecture rtl;
