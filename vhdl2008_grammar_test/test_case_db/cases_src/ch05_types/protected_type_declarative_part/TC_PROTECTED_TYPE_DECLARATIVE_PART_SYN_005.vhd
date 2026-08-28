-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_DECLARATIVE_PART_SYN_005
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_declarative_part ::=
--   { protected_type_declarative_item }
-- Test Focus: Subprogram declarations with VHDL-2008 extended
--   interface modes and default expressions in the protected
--   type declaration. Tests modern parameter features
--   within the declarative part repetition.
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- =============================================================
entity pt_decl_dp_ext_params is
  port (
    execute : in  bit;
    result  : out integer
  );
end entity pt_decl_dp_ext_params;

architecture rtl of pt_decl_dp_ext_params is
  type t_alu is protected
    procedure configure(width : natural := 8; signed_ops : boolean := true);
    impure function compute(a : integer; b : integer; op : bit_vector(1 downto 0)) return integer;
  end protected;
  type t_alu is protected body
    constant C_WIDTH : natural := 8;
    variable v_signed : boolean := true;
    procedure configure(width : natural := 8; signed_ops : boolean := true) is
    begin
      v_signed := signed_ops;
    end procedure;
    impure function compute(a : integer; b : integer; op : bit_vector(1 downto 0)) return integer is
    begin
      case op is
        when "00" => return a + b;
        when "01" => return a - b;
        when others => return a;
      end case;
    end function;
  end protected body;
  shared variable sv : t_alu;
begin
  process(execute)
  begin
    if execute'event and execute = '1' then
      sv.configure(width => 16, signed_ops => false);
      result <= sv.compute(10, 3, "00");
    end if;
  end process;
end architecture rtl;
