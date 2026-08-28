-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_DECLARATIVE_PART_SYN_004
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_declarative_part ::=
--   { protected_type_declarative_item }
-- Test Focus: Multiple impure function declarations with
--   different return types (integer, boolean, bit_vector).
--   Tests that diverse subprogram declarations all compose
--   within the repetition grammar.
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- =============================================================
entity pt_decl_dp_diverse_funcs is
  port (
    go     : in  bit;
    valid  : out bit
  );
end entity pt_decl_dp_diverse_funcs;

architecture rtl of pt_decl_dp_diverse_funcs is
  subtype t_byte is bit_vector(7 downto 0);
  type t_sensor is protected
    procedure sample(raw : integer);
    impure function value return integer;
    impure function in_range return boolean;
    impure function status_word return t_byte;
  end protected;
  type t_sensor is protected body
    variable v_raw : integer := 0;
    procedure sample(raw : integer) is begin v_raw := raw; end procedure;
    impure function value return integer is begin return v_raw; end function;
    impure function in_range return boolean is begin return v_raw >= 0 and v_raw <= 1023; end function;
    impure function status_word return t_byte is begin return "00000001"; end function;
  end protected body;
  shared variable sv : t_sensor;
begin
  process(go)
  begin
    if go'event and go = '1' then
      sv.sample(512);
      if sv.in_range then valid <= '1'; else valid <= '0'; end if;
    end if;
  end process;
end architecture rtl;
