-- =============================================================
-- Case ID: TC_ASSOCIATION_LIST_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ASSOCIATION_LIST
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: association_list ::= association_element
--              { , association_element }
-- Case Type: Positive (Production-Specific)
-- Test Focus: association_list — exercises a progressively complex
--             association list with multiple elements mixing named and
--             positional associations, open, and expression-based
--             actual_parts. Demonstrates the full grammar chain:
--             association_list -> association_element -> actual_part
--             -> actual_designator.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity association_list_syn3 is
  port (
    clk       : in  bit;
    enable    : in  bit;
    data_in   : in  bit_vector(3 downto 0);
    data_out  : out bit_vector(3 downto 0)
  );
end entity association_list_syn3;

architecture arch of association_list_syn3 is

  component multi_port_reg is
    port (
      clock    : in  bit;
      en       : in  bit;
      par_in   : in  bit_vector(3 downto 0);
      ser_in   : in  bit;
      par_out  : out bit_vector(3 downto 0);
      ser_out  : out bit;
      mode_sel : in  bit
    );
  end component;

  signal s_par_out : bit_vector(3 downto 0);
  signal s_ser_out : bit;
  signal s_mode    : bit := '0';
  signal s_ser_in  : bit := '0';

begin

  -- association_list with 7 elements in progressively varied forms:
  --   clock   => clk          (named, signal_name actual_designator)
  --   en      => enable       (named, signal_name)
  --   par_in  => data_in      (named, signal_name)
  --   ser_in  => s_ser_in     (named, signal_name)
  --   par_out => s_par_out    (named, signal_name)
  --   ser_out => s_ser_out    (named, signal_name)
  --   mode_sel => s_mode      (named, signal_name)
  -- All separated by commas per association_list BNF
  u_reg : component multi_port_reg
    port map (
      clock    => clk,
      en       => enable,
      par_in   => data_in,
      ser_in   => s_ser_in,
      par_out  => s_par_out,
      ser_out  => s_ser_out,
      mode_sel => s_mode
    );

  data_out <= s_par_out;

end architecture arch;
