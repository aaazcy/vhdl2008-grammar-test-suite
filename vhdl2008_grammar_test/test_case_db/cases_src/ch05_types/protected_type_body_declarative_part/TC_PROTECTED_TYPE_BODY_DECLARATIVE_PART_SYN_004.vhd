-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_BODY_DECLARATIVE_PART_SYN_004
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_body_declarative_part ::=
--   { protected_type_body_declarative_item }
-- Test Focus: Items with alias and constant interleaved with
--   multiple subprogram bodies in the declarative part.
--   Tests repetition with mixed item ordering.
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- =============================================================
entity pt_body_dp_alias_interleave is
  port (
    gate  : in  bit;
    seg7  : out bit_vector(6 downto 0)
  );
end entity pt_body_dp_alias_interleave;

architecture rtl of pt_body_dp_alias_interleave is
  subtype t_seg7 is bit_vector(6 downto 0);
  type t_7seg is protected
    procedure digit(n : natural);
    impure function segs return t_seg7;
  end protected;
  type t_7seg is protected body
    constant C_BLANK : bit_vector(6 downto 0) := "0000000";
    type t_lut is array(0 to 3) of bit_vector(6 downto 0);
    variable v_lut : t_lut := (0 => "0111111", 1 => "0000110", 2 => "1011011", 3 => "1001111");
    alias a_seg_a : bit is v_lut(0)(0);
    variable v_cur : bit_vector(6 downto 0) := C_BLANK;
    procedure digit(n : natural) is
    begin
      if n < 4 then v_cur := v_lut(n); end if;
    end procedure;
    impure function segs return t_seg7 is
    begin
      return v_cur;
    end function;
  end protected body;
  shared variable sv : t_7seg;
begin
  process(gate)
  begin
    if gate'event and gate = '1' then
      sv.digit(2);
      seg7 <= sv.segs;
    end if;
  end process;
end architecture rtl;
