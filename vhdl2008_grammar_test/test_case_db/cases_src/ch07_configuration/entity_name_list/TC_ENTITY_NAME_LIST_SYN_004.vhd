-- =============================================================
-- Case ID: TC_ENTITY_NAME_LIST_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_NAME_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_name_list ::= entity_designator { , entity_designator } | others | all
-- Case Type: Positive
-- Test Focus: Entity name list with entity_designators that include signatures — exercises the comma-separated entity_designator list alternative where some entity_designators carry [signature] blocks to disambiguate overloaded subprogram names, testing the full grammar including entity_tag [signature] within entity_name_list in a DSP filter context
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity enl_sig_filter is
  port(
    clk       : in  bit;
    sample_in : in  bit_vector(11 downto 0);
    coeff     : in  bit_vector(11 downto 0);
    result    : out bit_vector(23 downto 0)
  );
  attribute syn_pipeline : boolean;
  attribute syn_pipeline of sample_in, coeff, result : signal is true;
end entity;

architecture rtl of enl_sig_filter is
  attribute syn_multstyle : string;

  -- Overloaded multiply function: signed 12x12 -> 24
  function f_mult(a, b : bit_vector(11 downto 0)) return bit_vector is
    variable v : bit_vector(23 downto 0) := (others => '0');
    variable a_ext : bit_vector(23 downto 0) := (others => '0');
  begin
    a_ext(11 downto 0) := a;
    for i in 0 to 11 loop
      if b(i) = '1' then
        v := v xor a_ext;
      end if;
      a_ext := a_ext(22 downto 0) & '0';
    end loop;
    return v;
  end function;

  -- Overloaded multiply function: unsigned 8x8 -> 16 (different signature)
  function f_mult(a, b : integer) return integer is
  begin
    return a * b;
  end function;

  -- entity_name_list with entity_designators carrying signatures
  attribute syn_multstyle of
    f_mult[bit_vector, bit_vector return bit_vector],
    f_mult[integer, integer return integer]
    : function is "dsp48";

  signal s_reg  : bit_vector(11 downto 0) := (others => '0');
  signal c_reg  : bit_vector(11 downto 0) := (others => '0');
  signal prod   : bit_vector(23 downto 0) := (others => '0');
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      s_reg <= sample_in;
      c_reg <= coeff;
      prod  <= f_mult(s_reg, c_reg);
    end if;
  end process;
  result <= prod;
end architecture rtl;
