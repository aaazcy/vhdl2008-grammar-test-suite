-- =============================================================
-- Case ID: TC_TYPE_MARK_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_TYPE_MARK
-- Standard Reference: IEEE 1076-2008 Section 6.3
-- Production: type_mark ::= type_name [ 'range <>' ] | subtype_name
-- Case Type: Positive
-- Test Focus: Exercises type_mark with array type name and subtype_name in signal declarations within a barrel shifter.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity type_mark_syn3 is
  port (
    data_in   : in  bit_vector(7 downto 0);
    shift_amt : in  integer range 0 to 7;
    data_out  : out bit_vector(7 downto 0)
  );
end entity type_mark_syn3;

architecture rtl of type_mark_syn3 is
  subtype t_byte is bit_vector(7 downto 0);
  type t_shift_matrix is array(0 to 7) of t_byte;
  signal s_stages : t_shift_matrix := (others => (others => '0'));
begin
  s_stages(0) <= data_in;
  gen_shift: for i in 1 to 7 generate
    s_stages(i) <= s_stages(i-1)(6 downto 0) & '0';
  end generate;
  data_out <= s_stages(shift_amt) when shift_amt > 0 else data_in;
end architecture rtl;
