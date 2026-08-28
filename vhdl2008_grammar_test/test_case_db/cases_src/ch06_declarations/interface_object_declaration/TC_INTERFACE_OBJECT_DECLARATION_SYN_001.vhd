-- =============================================================
-- Case ID: TC_INTERFACE_OBJECT_DECLARATION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_OBJECT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_object_declaration ::=
--   interface_constant_declaration
--   | interface_signal_declaration
--   | interface_variable_declaration
--   | interface_file_declaration
-- Case Type: Positive
-- Test Focus: All four interface_object_declaration kinds exercised
--   in subprogram parameter lists within an entity/architecture:
--   constant (immutable input), variable (mutable inout),
--   signal (hardware port), file (external data).
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity iface_obj_all_four_kinds is
  port (
    clk   : in  bit;
    start : in  bit;
    dout  : out bit_vector(7 downto 0)
  );
end entity iface_obj_all_four_kinds;

architecture rtl of iface_obj_all_four_kinds is
  type bytefile is file of bit_vector;
  procedure process_data(
    constant  scale     : in  integer;
    variable  accum     : inout integer;
    signal    done_flag : out bit;
    file      datafile  : bytefile
  ) is
  begin
    accum := accum * scale;
    done_flag <= '1';
  end procedure;
  signal s_done : bit;
  signal s_val  : integer := 1;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      if start = '1' then
        dout <= (others => '0');
      elsif s_done = '1' then
        dout <= (others => '1');
      end if;
    end if;
  end process;
end architecture rtl;
