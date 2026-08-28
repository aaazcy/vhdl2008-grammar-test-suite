-- =============================================================
-- Case ID: TC_SUBPROGRAM_DECLARATIVE_PART_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Production: subprogram_declarative_part ::= { subprogram_declarative_item }
-- Case Type: Positive
-- Test Focus: subprogram_declarative_part: three items (type, constant, variable) — exercises the { subprogram_declarative_item } repetition with a realistic mix inside a function body
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sdp_three_items is
  port (
    data_in : in  bit_vector(7 downto 0);
    lsb_out : out bit_vector(3 downto 0);
    msb_out : out bit_vector(3 downto 0)
  );
end entity;

architecture test of sdp_three_items is
  function f_split(d : bit_vector(7 downto 0)) return bit_vector is
    -- Item 1: type_declaration
    type nibble_t is array(3 downto 0) of bit;
    -- Item 2: subtype_declaration
    subtype upper_nibble_t is nibble_t;
    -- Item 3: constant_declaration
    constant C_MSB_START : natural := 7;
    variable v_result : bit_vector(3 downto 0);
  begin
    v_result := d(C_MSB_START downto C_MSB_START - 3);
    return v_result;
  end function;

  function f_split_lo(d : bit_vector(7 downto 0)) return bit_vector is
    constant C_LSB_START : natural := 3;
    variable v_result : bit_vector(3 downto 0);
  begin
    v_result := d(C_LSB_START downto 0);
    return v_result;
  end function;
begin
  msb_out <= f_split(data_in);
  lsb_out <= f_split_lo(data_in);
end architecture test;
