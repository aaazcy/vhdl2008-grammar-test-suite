-- =============================================================
-- Case ID: TC_ENTITY_DESIGNATOR_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_designator ::= entity_tag [ signature ]
-- Case Type: Positive
-- Test Focus: Entity designator with signature [type_mark, type_mark return type_mark] — exercises entity_tag followed by a full multi-parameter signature with return type to disambiguate overloaded subprograms used in attribute specifications in a complex arithmetic unit context with multiple overloaded functions
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ed_arith_unit is
  port(
    clk     : in  bit;
    a       : in  bit_vector(15 downto 0);
    b       : in  bit_vector(15 downto 0);
    mode    : in  bit_vector(1 downto 0);
    result  : out bit_vector(31 downto 0)
  );
end entity;

architecture rtl of ed_arith_unit is
  attribute syn_preserve : boolean;
  attribute syn_encoding : string;

  -- Overloaded function #1: signed multiply
  function f_compute(x, y : bit_vector(15 downto 0)) return bit_vector is
    variable v : bit_vector(31 downto 0) := (others => '0');
    variable x_ext : bit_vector(31 downto 0) := (others => '0');
  begin
    x_ext(15 downto 0) := x;
    for i in 0 to 15 loop
      if y(i) = '1' then
        v := v xor x_ext;
      end if;
      x_ext := x_ext(30 downto 0) & '0';
    end loop;
    return v;
  end function;

  -- Overloaded function #2: unsigned add with different signature
  function f_compute(x, y : integer) return integer is
  begin
    return x + y;
  end function;

  -- Overloaded function #3: bitwise XOR
  function f_compute(x : bit_vector(15 downto 0); y : bit) return bit_vector is
    variable v : bit_vector(15 downto 0);
  begin
    if y = '1' then
      v := not x;
    else
      v := x;
    end if;
    return v;
  end function;

  -- entity_designator with signature disambiguating the three overloads
  attribute syn_preserve of f_compute
    [bit_vector, bit_vector return bit_vector] : function is true;
  attribute syn_encoding of f_compute
    [bit_vector, bit return bit_vector] : function is "one_hot";

  signal a_r, b_r : bit_vector(15 downto 0) := (others => '0');
  signal prod     : bit_vector(31 downto 0) := (others => '0');
  signal xor_res  : bit_vector(15 downto 0) := (others => '0');
  signal sum_res  : bit_vector(31 downto 0) := (others => '0');
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      a_r <= a;
      b_r <= b;
      prod    <= f_compute(a_r, b_r);
      xor_res <= f_compute(a_r, mode(0));
      sum_res <= (others => '0');
    end if;
  end process;

  with mode select
    result <= prod    when "00",
              sum_res when "01",
              (x"0000" & xor_res) when "10",
              (others => '0') when others;
end architecture rtl;
