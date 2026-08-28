-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_BODY_SYN_002
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_body ::=
--   protected body
--     protected_type_body_declarative_part
--   end protected body [ protected_type_simple_name ]
-- Test Focus: Protected body implementing two procedures and a
--   function. Tests multiple subprogram bodies within one
--   protected body declarative part. No optional trailing name.
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- =============================================================
entity pt_body_multi_method is
  port (
    rst_n : in  bit;
    en    : in  bit;
    val   : out integer
  );
end entity pt_body_multi_method;

architecture rtl of pt_body_multi_method is
  type t_accum is protected
    procedure reset;
    procedure add(v : integer);
    impure function total return integer;
  end protected;
  type t_accum is protected body
    variable v_sum : integer := 0;
    procedure reset is
    begin
      v_sum := 0;
    end procedure;
    procedure add(v : integer) is
    begin
      v_sum := v_sum + v;
    end procedure;
    impure function total return integer is
    begin
      return v_sum;
    end function;
  end protected body;
  shared variable sv_acc : t_accum;
begin
  process(rst_n, en)
  begin
    if rst_n = '0' then
      sv_acc.reset;
      val <= 0;
    elsif en = '1' then
      sv_acc.add(3);
      val <= sv_acc.total;
    end if;
  end process;
end architecture rtl;
