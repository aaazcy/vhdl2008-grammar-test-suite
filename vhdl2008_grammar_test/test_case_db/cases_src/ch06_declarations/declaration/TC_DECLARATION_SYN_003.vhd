-- =============================================================
-- Case ID: TC_DECLARATION_SYN_003
-- Rule Type: Syntax
-- BNF Production: DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.1
-- Production: declaration ::= type_declaration | subtype_declaration
--   | object_declaration | interface_declaration
--   | alias_declaration | attribute_declaration
--   | component_declaration | group_template_declaration
--   | group_declaration | entity_declaration
--   | configuration_declaration | subprogram_declaration
--   | package_declaration
-- Test Focus: component_declaration with alias_declaration,
--   group_template_declaration, group_declaration, and
--   attribute_declaration — exercises the rarer declaration
--   alternatives in a hardware design context
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity declaration_syn_003 is
  port (
    clk      : in  bit;
    rst_n    : in  bit;
    data_in  : in  bit_vector(7 downto 0);
    valid_in : in  bit;
    data_out : out bit_vector(7 downto 0);
    valid_out: out bit
  );
end entity declaration_syn_003;

architecture rtl of declaration_syn_003 is
  -- TYPE_DECLARATION: record type for pipeline stage
  type t_pipe_reg is record
    payload : bit_vector(7 downto 0);
    valid   : bit;
  end record;

  -- SUBTYPE_DECLARATION: subtype of record
  subtype t_pipe_stage is t_pipe_reg;

  -- SIGNAL_DECLARATION: pipeline registers
  signal s_stage0 : t_pipe_stage := (payload => (others => '0'), valid => '0');
  signal s_stage1 : t_pipe_stage := (payload => (others => '0'), valid => '0');

  -- ALIAS_DECLARATION: alias for payload fields
  alias a_s0_data is s_stage0.payload;
  alias a_s1_data is s_stage1.payload;

  -- ATTRIBUTE_DECLARATION: user-defined attribute
  attribute pipe_depth : integer;
  attribute pipe_depth of s_stage0 : signal is 1;
  attribute pipe_depth of s_stage1 : signal is 2;

  -- COMPONENT_DECLARATION: basic register component
  component reg_slice is
    port (
      ck   : in  bit;
      rst  : in  bit;
      d    : in  bit_vector(7 downto 0);
      q    : out bit_vector(7 downto 0)
    );
  end component;

  -- GROUP_TEMPLATE_DECLARATION
  group pipe_group is (signal, signal);

  -- GROUP_DECLARATION
  group g_pipeline : pipe_group (s_stage0, s_stage1);

  -- CONSTANT_DECLARATION
  constant C_ZERO_BYTE : bit_vector(7 downto 0) := (others => '0');

  -- SUBPROGRAM_DECLARATION: parity generator
  function f_parity(data : bit_vector(7 downto 0)) return bit is
    variable v : bit := '0';
  begin
    for i in data'range loop
      v := v xor data(i);
    end loop;
    return v;
  end function;

  -- Internal signals
  signal s_parity_bit : bit;

begin
  -- Input stage
  s_stage0.payload <= data_in when valid_in = '1' else a_s0_data;

  -- Parity check on stage0 data
  s_parity_bit <= f_parity(a_s0_data);

  -- Pipeline advance
  s_stage1.payload <= a_s0_data;

  -- Output drivers
  data_out  <= a_s1_data;
  valid_out <= s_stage1.valid;

  -- Register stage1 valid on clock
  process(clk, rst_n)
  begin
    if rst_n = '0' then
      s_stage0.valid <= '0';
      s_stage1.valid <= '0';
    elsif clk'event and clk = '1' then
      s_stage0.valid <= valid_in;
      s_stage1.valid <= s_stage0.valid;
    end if;
  end process;
end architecture rtl;
